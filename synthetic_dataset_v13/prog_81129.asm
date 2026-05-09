; DESCRIPTION: Renders a cyan box of size 54x53 starting at (33, 127).
; PLAN: r0=33(x), r1=127(y), r2=54(width), r3=53(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 127
LDI r2, 54
LDI r3, 53
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
