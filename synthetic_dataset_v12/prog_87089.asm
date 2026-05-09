; DESCRIPTION: Renders a cyan box of size 111x35 starting at (244, 53).
; PLAN: r0=244(x), r1=53(y), r2=111(width), r3=35(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 53
LDI r2, 111
LDI r3, 35
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
