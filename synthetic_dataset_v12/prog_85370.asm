; DESCRIPTION: Places a white 48x26 rectangle at position (192, 213).
; PLAN: r0=192(x), r1=213(y), r2=48(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 213
LDI r2, 48
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
