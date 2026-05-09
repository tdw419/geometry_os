; DESCRIPTION: Renders a yellow box of size 120x47 starting at (238, 197).
; PLAN: r0=238(x), r1=197(y), r2=120(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 197
LDI r2, 120
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
