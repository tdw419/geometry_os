; DESCRIPTION: Renders a cyan box of size 100x109 starting at (85, 113).
; PLAN: r0=85(x), r1=113(y), r2=100(width), r3=109(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 113
LDI r2, 100
LDI r3, 109
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
