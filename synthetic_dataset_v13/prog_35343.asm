; DESCRIPTION: Renders a cyan box of size 110x64 starting at (304, 79).
; PLAN: r0=304(x), r1=79(y), r2=110(width), r3=64(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 79
LDI r2, 110
LDI r3, 64
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
