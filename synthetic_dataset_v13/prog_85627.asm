; DESCRIPTION: Renders a white box of size 21x85 starting at (415, 151).
; PLAN: r0=415(x), r1=151(y), r2=21(width), r3=85(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 151
LDI r2, 21
LDI r3, 85
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
