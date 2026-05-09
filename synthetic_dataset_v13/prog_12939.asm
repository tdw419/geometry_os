; DESCRIPTION: Places a cyan 106x10 rectangle at position (136, 167).
; PLAN: r0=136(x), r1=167(y), r2=106(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 167
LDI r2, 106
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
