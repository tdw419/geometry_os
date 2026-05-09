; DESCRIPTION: Renders a green box of size 113x32 starting at (156, 86).
; PLAN: r0=156(x), r1=86(y), r2=113(width), r3=32(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 86
LDI r2, 113
LDI r3, 32
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
