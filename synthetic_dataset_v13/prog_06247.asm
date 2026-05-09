; DESCRIPTION: Places a cyan 120x63 rectangle at position (253, 190).
; PLAN: r0=253(x), r1=190(y), r2=120(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 190
LDI r2, 120
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
