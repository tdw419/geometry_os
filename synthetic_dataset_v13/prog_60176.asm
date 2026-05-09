; DESCRIPTION: Places a orange line segment connecting (481, 46) to (242, 29).
; PLAN: r0=481(x1), r1=46(y1), r2=242(x2), r3=29(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 46
LDI r2, 242
LDI r3, 29
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
