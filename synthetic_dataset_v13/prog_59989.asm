; DESCRIPTION: Draws a orange line from (488, 254) to (305, 138).
; PLAN: r0=488(x1), r1=254(y1), r2=305(x2), r3=138(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 254
LDI r2, 305
LDI r3, 138
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
