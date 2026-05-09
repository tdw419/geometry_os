; DESCRIPTION: Renders a yellow box of size 103x53 starting at (202, 179).
; PLAN: r0=202(x), r1=179(y), r2=103(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 179
LDI r2, 103
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
