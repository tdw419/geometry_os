; DESCRIPTION: Renders a cyan box of size 34x95 starting at (410, 125).
; PLAN: r0=410(x), r1=125(y), r2=34(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 125
LDI r2, 34
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
