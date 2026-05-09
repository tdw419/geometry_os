; DESCRIPTION: Places a cyan 10x29 rectangle at position (340, 213).
; PLAN: r0=340(x), r1=213(y), r2=10(width), r3=29(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 213
LDI r2, 10
LDI r3, 29
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
