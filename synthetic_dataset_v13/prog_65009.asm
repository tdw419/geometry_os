; DESCRIPTION: Composite: Places a green dot at position (308, 38) then Renders a orange box of size 43x86 starting at (360, 121).
; PLAN: r0=308(x), r1=38(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=360(x), r6=121(y), r7=43(width), r8=86(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 308
LDI r1, 38
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 360
LDI r6, 121
LDI r7, 43
LDI r8, 86
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
