; DESCRIPTION: Renders a cyan box of size 83x60 starting at (173, 134).
; PLAN: r0=173(x), r1=134(y), r2=83(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 134
LDI r2, 83
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
