; DESCRIPTION: Composite: Renders a orange box of size 83x53 starting at (38, 173) then Places a yellow dot at position (441, 227).
; PLAN: r0=38(x), r1=173(y), r2=83(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=441(x), r6=227(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 38
LDI r1, 173
LDI r2, 83
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 441
LDI r6, 227
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
