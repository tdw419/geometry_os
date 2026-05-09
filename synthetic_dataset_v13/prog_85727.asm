; DESCRIPTION: Renders a red box of size 54x95 starting at (410, 66).
; PLAN: r0=410(x), r1=66(y), r2=54(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 66
LDI r2, 54
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
