; DESCRIPTION: Renders a cyan box of size 26x47 starting at (128, 132).
; PLAN: r0=128(x), r1=132(y), r2=26(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 132
LDI r2, 26
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
