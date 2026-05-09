; DESCRIPTION: Places a white 64x32 rectangle at position (175, 187).
; PLAN: r0=175(x), r1=187(y), r2=64(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 187
LDI r2, 64
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
