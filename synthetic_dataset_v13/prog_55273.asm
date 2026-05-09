; DESCRIPTION: Creates a cyan rectangular region at (374, 238) spanning 120 by 15 pixels.
; PLAN: r0=374(x), r1=238(y), r2=120(width), r3=15(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 238
LDI r2, 120
LDI r3, 15
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
