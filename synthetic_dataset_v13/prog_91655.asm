; DESCRIPTION: Places a cyan 16x42 rectangle at position (44, 113).
; PLAN: r0=44(x), r1=113(y), r2=16(width), r3=42(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 113
LDI r2, 16
LDI r3, 42
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
