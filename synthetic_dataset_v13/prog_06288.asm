; DESCRIPTION: Places a white 120x63 rectangle at position (177, 128).
; PLAN: r0=177(x), r1=128(y), r2=120(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 128
LDI r2, 120
LDI r3, 63
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
