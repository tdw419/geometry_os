; DESCRIPTION: Places a white 10x32 rectangle at position (294, 223).
; PLAN: r0=294(x), r1=223(y), r2=10(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 223
LDI r2, 10
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
