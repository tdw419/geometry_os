; DESCRIPTION: Renders a green box of size 94x64 starting at (182, 29).
; PLAN: r0=182(x), r1=29(y), r2=94(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 29
LDI r2, 94
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
