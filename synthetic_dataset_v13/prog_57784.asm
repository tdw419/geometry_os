; DESCRIPTION: Creates a cyan rectangular region at (434, 138) spanning 45 by 32 pixels.
; PLAN: r0=434(x), r1=138(y), r2=45(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 138
LDI r2, 45
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
