; DESCRIPTION: Places a white 67x64 rectangle at position (248, 190).
; PLAN: r0=248(x), r1=190(y), r2=67(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 190
LDI r2, 67
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
