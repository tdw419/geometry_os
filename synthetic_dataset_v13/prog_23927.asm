; DESCRIPTION: Renders a cyan box of size 109x69 starting at (30, 113).
; PLAN: r0=30(x), r1=113(y), r2=109(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 113
LDI r2, 109
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
