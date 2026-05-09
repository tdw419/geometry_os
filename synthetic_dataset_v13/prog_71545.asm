; DESCRIPTION: Renders a yellow box of size 47x53 starting at (375, 146).
; PLAN: r0=375(x), r1=146(y), r2=47(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 146
LDI r2, 47
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
