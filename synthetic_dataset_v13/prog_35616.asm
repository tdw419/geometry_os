; DESCRIPTION: Creates a cyan rectangular region at (87, 24) spanning 39 by 27 pixels.
; PLAN: r0=87(x), r1=24(y), r2=39(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 24
LDI r2, 39
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
