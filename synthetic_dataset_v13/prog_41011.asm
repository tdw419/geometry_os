; DESCRIPTION: Places a cyan 42x44 rectangle at position (340, 1).
; PLAN: r0=340(x), r1=1(y), r2=42(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 1
LDI r2, 42
LDI r3, 44
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
