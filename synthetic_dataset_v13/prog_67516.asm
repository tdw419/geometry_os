; DESCRIPTION: Renders a cyan box of size 52x14 starting at (415, 104).
; PLAN: r0=415(x), r1=104(y), r2=52(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 104
LDI r2, 52
LDI r3, 14
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
