; DESCRIPTION: Creates a cyan rectangular region at (434, 36) spanning 16 by 18 pixels.
; PLAN: r0=434(x), r1=36(y), r2=16(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 36
LDI r2, 16
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
