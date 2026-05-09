; DESCRIPTION: Renders a cyan box of size 95x22 starting at (329, 113).
; PLAN: r0=329(x), r1=113(y), r2=95(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 113
LDI r2, 95
LDI r3, 22
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
