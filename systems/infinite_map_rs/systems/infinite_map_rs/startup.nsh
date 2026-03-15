@echo -off
for %i in 0 1 2 3 4 5 6 7 8 9 A B C D E F
  if exist %i:\EFI\BOOT\BOOTX64.EFI then
    %i:
    \EFI\BOOT\BOOTX64.EFI
    goto DONE
  endif
endfor
:DONE
