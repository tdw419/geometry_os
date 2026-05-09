; DESCRIPTION: Renders a cyan box of size 70x113 starting at (227, 113).
; PLAN: r0=227(x), r1=113(y), r2=70(width), r3=113(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 113
LDI r2, 70
LDI r3, 113
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
