; DESCRIPTION: Draws a white line from (42, 141) to (392, 117).
; PLAN: r0=42(x1), r1=141(y1), r2=392(x2), r3=117(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 141
LDI r2, 392
LDI r3, 117
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
