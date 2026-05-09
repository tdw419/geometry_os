; DESCRIPTION: Renders a cyan box of size 86x88 starting at (300, 113).
; PLAN: r0=300(x), r1=113(y), r2=86(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 113
LDI r2, 86
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
