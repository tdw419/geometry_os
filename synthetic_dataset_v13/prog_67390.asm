; DESCRIPTION: Creates a cyan rectangular region at (262, 98) spanning 19 by 12 pixels.
; PLAN: r0=262(x), r1=98(y), r2=19(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 98
LDI r2, 19
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
