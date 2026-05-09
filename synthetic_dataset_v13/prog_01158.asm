; DESCRIPTION: Places a yellow 26x59 rectangle at position (395, 169).
; PLAN: r0=395(x), r1=169(y), r2=26(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 169
LDI r2, 26
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
