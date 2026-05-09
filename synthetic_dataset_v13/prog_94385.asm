; DESCRIPTION: Places a white 116x42 rectangle at position (176, 192).
; PLAN: r0=176(x), r1=192(y), r2=116(width), r3=42(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 192
LDI r2, 116
LDI r3, 42
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
