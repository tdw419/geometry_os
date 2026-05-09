; DESCRIPTION: Places a cyan 16x28 rectangle at position (135, 172).
; PLAN: r0=135(x), r1=172(y), r2=16(width), r3=28(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 172
LDI r2, 16
LDI r3, 28
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
