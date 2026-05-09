; DESCRIPTION: Renders a cyan box of size 103x29 starting at (28, 8).
; PLAN: r0=28(x), r1=8(y), r2=103(width), r3=29(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 8
LDI r2, 103
LDI r3, 29
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
