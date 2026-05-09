; DESCRIPTION: Places a white 88x86 rectangle at position (154, 126).
; PLAN: r0=154(x), r1=126(y), r2=88(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 126
LDI r2, 88
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
