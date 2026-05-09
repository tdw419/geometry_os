; DESCRIPTION: Draws a white line from (280, 45) to (32, 236).
; PLAN: r0=280(x1), r1=45(y1), r2=32(x2), r3=236(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 45
LDI r2, 32
LDI r3, 236
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
