; DESCRIPTION: Draws a orange line from (350, 242) to (48, 42).
; PLAN: r0=350(x1), r1=242(y1), r2=48(x2), r3=42(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 242
LDI r2, 48
LDI r3, 42
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
