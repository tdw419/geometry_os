; DESCRIPTION: Draws a white line from (48, 222) to (228, 117).
; PLAN: r0=48(x1), r1=222(y1), r2=228(x2), r3=117(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 222
LDI r2, 228
LDI r3, 117
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
