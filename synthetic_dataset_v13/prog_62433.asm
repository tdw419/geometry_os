; DESCRIPTION: Renders a white box of size 113x117 starting at (328, 27).
; PLAN: r0=328(x), r1=27(y), r2=113(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 27
LDI r2, 113
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
