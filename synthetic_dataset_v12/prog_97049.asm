; DESCRIPTION: Places a cyan 36x64 rectangle at position (269, 49).
; PLAN: r0=269(x), r1=49(y), r2=36(width), r3=64(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 49
LDI r2, 36
LDI r3, 64
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
