; DESCRIPTION: Places a white 115x32 rectangle at position (269, 55).
; PLAN: r0=269(x), r1=55(y), r2=115(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 55
LDI r2, 115
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
