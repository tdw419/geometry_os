; DESCRIPTION: Places a cyan 79x90 rectangle at position (253, 166).
; PLAN: r0=253(x), r1=166(y), r2=79(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 166
LDI r2, 79
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
