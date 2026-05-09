; DESCRIPTION: Creates a cyan rectangular region at (82, 113) spanning 81 by 50 pixels.
; PLAN: r0=82(x), r1=113(y), r2=81(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 113
LDI r2, 81
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
