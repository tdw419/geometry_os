; DESCRIPTION: Renders a cyan box of size 57x58 starting at (384, 158).
; PLAN: r0=384(x), r1=158(y), r2=57(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 158
LDI r2, 57
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
