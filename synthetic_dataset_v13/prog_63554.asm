; DESCRIPTION: Renders a yellow box of size 44x59 starting at (241, 190).
; PLAN: r0=241(x), r1=190(y), r2=44(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 190
LDI r2, 44
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
