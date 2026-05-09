; DESCRIPTION: Creates a red rectangular region at (295, 221) spanning 117 by 34 pixels.
; PLAN: r0=295(x), r1=221(y), r2=117(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 221
LDI r2, 117
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
