; DESCRIPTION: Places a cyan 32x97 rectangle at position (175, 150).
; PLAN: r0=175(x), r1=150(y), r2=32(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 150
LDI r2, 32
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
