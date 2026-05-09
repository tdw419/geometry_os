; DESCRIPTION: Places a yellow 102x112 rectangle at position (190, 33).
; PLAN: r0=190(x), r1=33(y), r2=102(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 33
LDI r2, 102
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
